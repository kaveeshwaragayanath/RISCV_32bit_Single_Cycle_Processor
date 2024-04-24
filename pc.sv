`timescale 1ns / 1ps
module pc
		
    (input logic [7:0] a,
	  input logic clk,reset,
     output logic [7:0] y);
	  always @(posedge clk) begin
			if (reset == 1 )begin 
				y <= 8'b00000000;
			 end else begin 
				y <= a;
			 end 
     end
	  
endmodule 