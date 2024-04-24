`timescale 1ns / 1ps

module tb_pc_with_adder_regfiles;
    // Inputs
    reg [7:0] pc_input;
    reg clk;
    reg reset;
    reg rg_wrt_en;
    reg [31:0] write_data;

    // Outputs
    wire [31:0] rg_rd_data1;
    wire [31:0] rg_rd_data2;

    // Instantiate the DUT (Design Under Test)
    pc_with_adder_regfiles uut (
        .pc_input(pc_input),
        .clk(clk),
        .reset(reset),
        .rg_wrt_en(rg_wrt_en),
        .write_data(write_data),
        .rg_rd_data1(rg_rd_data1),
        .rg_rd_data2(rg_rd_data2)
    );

    // Clock generation
    always begin
       #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
	     clk=0;
	     pc_input = 8'b00000000;
        
        rg_wrt_en = 1;
        // Release reset
        write_data=32'h00100093;
        reset  = 0;
		  #10
		  pc_input = 8'b00000001;
        
        rg_wrt_en = 1;
        // Release reset
        write_data=32'h00100094;
        reset  = 1;
		  #10;

        // Test cases
        // Write to register file
//        rg_wrt_en = 1;
//        
//        write_data = 32'h12345678;
//        #10; // Allow some time for the operation to complete
//        rg_wrt_en = 0;
//        // Initialize signals
//        
//		 
//
//        // Release reset after a few clock cycles
//        #10 reset = 0;
//
//        // Loop to test different pc_input values
//        for (int i = 0; i < 5; i = i + 1) begin
//            // Apply a new pc_input value
//            pc_input = i;
//
//            // Monitor instruction signal
//            
//
//            // Wait for a few clock cycles between inputs
//            #10;
//        end
		  $stop;

        // Terminate the simulation
        $finish;
	  end 
endmodule
