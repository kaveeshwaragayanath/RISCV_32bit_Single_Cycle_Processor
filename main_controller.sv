`timescale 1ns / 1ps


module main_controller(
    
    //Input
    input logic [6:0] Opcode, //7-bit opcode field from the instruction
    
	 
    //Outputs
    output logic ALUSrc,//0: The second ALU operand comes from the second register file output (Read data 2); 
                        //1: The second ALU operand is the sign-extended, lower 16 bits of the instruction.
    output logic [1:0]  Result_Src,
    output logic RegWrite, //The register on the Write register input is written with the value on the Write data input 
    output logic [1:0] Imm_Src, //Data memory contents designated by the address input are put on the Read data output
    output logic MemWrite, //Data memory contents designated by the address input are replaced by the value on the Write data input.
   
    output logic [1:0] ALUOp,
	 output logic jump,
	 output logic Branch
    

);

//    localparam R_TYPE = 7'b0110011;
//    localparam LW     = 7'b0000011;
//    localparam SW     = 7'b0100011;
//    localparam BR     = 7'b1100011;
//    localparam RTypeI = 7'b0010011; //addi,ori,andi
     
    logic [6:0] R_TYPE, LW, SW, RTypeI;
	 
    assign  BR     = 7'b1100011;
    assign  R_TYPE = 7'b0110011;
    assign  LW     = 7'b0000011;
    assign  SW     = 7'b0100011;
    assign  RTypeI = 7'b0010011; //addi,ori,andi
   
	 always_comb begin
    case (Opcode)
        7'b0110011: begin
            ALUSrc <= 1;
            Result_Src <= 2'b00;
            RegWrite <= 1;
            Imm_Src <= 2'bxx;
            MemWrite <= 0;
            ALUOp <= 2'b10;
            jump <= 0;
            Branch <= 0;
        end // R

        7'b0000011: begin
            ALUSrc <= 0;
            Result_Src <= 2'b01;
            RegWrite <= 1;
            Imm_Src <= 2'b00;
            MemWrite <= 0;
            ALUOp <= 2'b00;
            jump <= 0;
            Branch <= 0;
        end // LW

        7'b0100011: begin
            ALUSrc <= 0;
            Result_Src <= 2'bxx;
            RegWrite <= 0;
            Imm_Src <= 2'b01;
            MemWrite <= 1;
            ALUOp <= 2'b00;
            jump <= 0;
            Branch <= 0;
        end // SW

        7'b0010011: begin
            ALUSrc <= 0;
            Result_Src <= 2'b00;
            RegWrite <= 1;
            Imm_Src <= 2'b00;
            MemWrite <= 0;
            ALUOp <= 2'b10;
            jump <= 0;
            Branch <= 0;
        end // I
		  
		  7'b1100011: begin
		      ALUSrc <= 1;
            Result_Src <= 2'bxx;
            RegWrite <= 0;
            Imm_Src <= 2'b10;
            MemWrite <= 0;
            ALUOp <= 2'b01;
            jump <= 0;
            Branch <= 1;
        end // B
		  
		  7'b1101111:begin 
		      ALUSrc <= 1'bx;
            Result_Src <= 2'b10;
            RegWrite <= 1;
            Imm_Src <= 2'b11;
            MemWrite <= 0;
            ALUOp <= 2'bxx;
            jump <= 1;
            Branch <= 0;
        end //J

        default: begin
            // Handle any other Opcode values
            ALUSrc <= 0;
            Result_Src <= 0;
            RegWrite <= 1;
            Imm_Src <= 0;
            MemWrite <= 0;
            ALUOp <= 2'bxx;
            jump <= 1;
            Branch <= 0;
        end
    endcase
end


endmodule
