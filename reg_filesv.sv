`timescale 1ns / 1ps

module reg_filesv
   (
   // Inputs 
   input  clk, //clock
   input  rst,//synchronous reset; if it is asserted (rst=1), all registers are reseted to 0
   input  rg_wrt_en, //write signal
   input  [4:0] rg_wrt_dest, //address of the register that supposed to written into
   input  [4:0] rg_rd_addr1, //first address to be read from
   input  [4:0] rg_rd_addr2, //second address to be read from
   input  [31:0] rg_wrt_data, // data that supposed to be written into the register file
         
   // Outputs
	
   output logic [31:0] rg_rd_data1, //content of reg_file[rg_rd_addr1] is loaded into
   output logic [31:0] rg_rd_data2 //content of reg_file[rg_rd_addr2] is loaded into
   );


integer 	 i;

logic [31:0] register_file [31:0];





always @(posedge clk) begin    // brfore thibbe posedge 
   if(rst==1'b1)
      for (i = 0; i < 32; i = i + 1)
		    if (i == 0) // Initialize register 0 with a constant value
            register_file[i] <= 32'h00000000;
          else if (i == 9) // Initialize register 9 with a constant value
            register_file[i] <= 32'b00000000000000000000000000001111;
          else if (i == 10) // Initialize register 10 with a constant value
            register_file[i] <= 32'b00000000000000000000000000001010;
			 else if (i == 1 )
			   register_file[i] <= 32'b00000000000000000000000000001010;
          else // Initialize other registers to 0
            register_file[i] <= 32'h00000000;
          
   if(rst==1'b0 && rg_wrt_en==1'b1)
      register_file[rg_wrt_dest] <=rg_wrt_data;
   
end




assign rg_rd_data1 = register_file[rg_rd_addr1];
assign rg_rd_data2 = register_file[rg_rd_addr2];


endmodule
