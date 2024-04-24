module alu_dec (
    input logic f7b5, op5,
    input logic [2:0] func3,
    input logic [1:0] aluop,
    output logic [3:0] alucontrol
);

    logic addSubType;
    assign addSubType = f7b5 & op5;

    always_comb
        case (aluop)
            2'b00: alucontrol <= 4'b0010; // add
            2'b01: begin
                // When aluop is 01, check the second bit of func3
                case (func3[1])
                    1'b0: alucontrol <= 4'b0110; // sub
                    1'b1: alucontrol <= 4'b0111; // Modified behavior
                    default: alucontrol <= 4'bxxxx; // Undefined
                endcase
            end
            default: case ({addSubType, func3})
                4'b0000: alucontrol <= 4'b0010; // add
                4'b1000: alucontrol <= 4'b0110; // sub
                4'b0111: alucontrol <= 4'b0000; // and
                4'b0110: alucontrol <= 4'b0001; // or
                4'b0001: alucontrol <= 4'b0100; // SLL
                4'b0010: alucontrol <= 4'b1010; // SLT
                4'b0011: alucontrol <= 4'b0101; // SLTU
                4'b0100: alucontrol <= 4'b0011; // xor
                4'b0101: begin 
					         case (f7b5)
								      1'b0: alucontrol <= 4'b1000; // srl
                              1'b1: alucontrol <= 4'b1100; // sra
	                           default: alucontrol <= 4'bxxxx; // Undefined
								endcase 
					end 
                4'b1101: alucontrol <= 4'b1100; // sra
					 4'b1111: alucontrol <= 4'b1111;//mul
                default: alucontrol <= 4'bxxxx;
            endcase
        endcase
endmodule
		
						