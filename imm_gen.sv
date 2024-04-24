module imm_gen(
     input logic [1:0] imm_src,
     input logic [31:0] inst_code,
     output logic [31:0] Imm_out
	  );
	  
	  always_comb begin 
	       case(imm_src)
			    2'b00: Imm_out={{21{inst_code[31]}},inst_code[30:20]}; //I - type
				 2'b01: Imm_out={{21{inst_code[31]}},inst_code[30:25],inst_code[11:7]}; //S - type
				 2'b10: Imm_out={inst_code[31]? 20'b1:20'b0 , inst_code[7], inst_code[30:25],inst_code[11:8],1'b0}; //B - type
				 2'b11:begin
                // When aluop is 01, check the second bit of func3
                case (inst_code[6:0])
                    7'b1101111 : Imm_out = {inst_code[31]? 12'b1:12'b0 ,  inst_code[19:12],inst_code[20], inst_code[30:25],inst_code[24:21],1'b0}; //JAL -type
                    7'b1100111: Imm_out = {inst_code[31]? 20'b1:20'b0 , inst_code[30:25], inst_code[24:21], inst_code[20]};//JALR - type 
                    default: Imm_out=32'bx;
                endcase
            end 
				 
				 
				 default: Imm_out=32'bx;
				 
			 endcase 
     end 
endmodule	  