`timescale 1ns / 1ps

module pc_tb;
    // Parameters
    parameter WIDTH = 8;

    // Signals
    logic clk;
    logic reset;
    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] y;

    // Instantiate the pc module
    pc  uut (
        .a(a),
        .clk(clk),
        .reset(reset),
        .y(y)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        a = 8'b00000000; // Set your test input value here

        // Apply a reset
        
        #10;
        a = 8'b00000001; 
        // Wait for some time
        #10 ;
        a = 8'b00000010; 
        #10;
		  a = 8'b00000011;
		  #10;
		  a = 8'b00000100;
        // Deassert reset and perform some tests
        reset = 1;
		  #10;

        // Monitor the output y
       

        // Add more test cases or stimulus as needed
        $stop;
        // Terminate the simulation
        $finish;
    end

endmodule
