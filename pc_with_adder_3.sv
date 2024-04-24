`timescale 1ns / 1ps




module pc_with_adder_3
     
    (
     input logic clk,reset,
	  output logic [31:0] instruction
	  
	  );
	   logic [7:0] pc_input;
//	  logic [7:0] out;
	  logic [7:0] pc_output;
	  
	  
	  pc pc_module (
	  .a(pc_input),
	  .clk(clk),
	  .reset(reset),
	  .y(pc_output)
	  );
	  
	  adder_8  pcadd (
	  .a(pc_output),
	  .b(8'b00000100),
	  .y(pc_input)
	  );
	  
     ins_memory ins_mem(
	  .clk(clk),
	  .address_in(pc_output),
	  .instruction_out(instruction)
	  );
	  
endmodule 