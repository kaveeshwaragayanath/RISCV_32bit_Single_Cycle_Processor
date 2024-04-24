module data_mem(
      input logic we,clk,
		input logic [31:0] write_data, address,
		output logic [31:0] read_data
		);
		
		logic [31:0] RAM[255:0];
		
		initial begin
        integer i;
        for (i = 0; i < 256; i = i + 1) begin
            RAM[i] = i;
        end
        // Add any other code or simulations here
      end
		
		assign read_data = RAM[address[5:0]];
//		always @(posedge clk) begin
//       if (re)
//            read_data <= RAM[address[5:0]];
//      end 
		
    
      always @(posedge clk) begin
       if (we)
            RAM[address[5:0]] <= write_data;
      end 
		
endmodule
