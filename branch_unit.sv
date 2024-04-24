module branch_unit (
       input logic [2:0] funct3,
       input logic Branch,
		 input logic zero,
		 input logic jump,
		 input logic Con_BLT,
		 input logic Con_BGT,
		 output logic PC_Src
		 );
		 logic Con_beq, Con_bnq,  Con_blt, Con_bgt;
		 
		 assign Con_beq = (Branch)&&(funct3==3'b000);
       assign Con_bnq = (Branch)&&(funct3==3'b001);
       assign Con_blt = (Branch)&&(funct3==3'b100||funct3==3'b110);
       assign Con_bgt = (Branch)&&(funct3==3'b101||funct3==3'b111);

		 assign PC_Src = (Con_beq&&zero)||(Con_bnq&&!zero)||(Con_bgt&&Con_BGT)||(Con_blt&&Con_BLT)||jump; 
		 
endmodule
