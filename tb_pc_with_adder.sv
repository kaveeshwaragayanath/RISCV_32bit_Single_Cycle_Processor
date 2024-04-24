`timescale 1ns / 1ps

module tb_pc_with_adder;
    // Parameters
    parameter WIDTH = 8;

    // Signals
    logic clk = 0;            // Clock signal
    logic reset = 0;          // Reset signal
    logic [7:0] pc_input;     // Input signal
	 logic [7:0] pc_output;
    logic [7:0] out;    // Output signal

    // Instantiate the pc_with_adder module
    pc_with_adder  u_pc_with_adder (
        .pc_input(pc_input), // Connect the input signal pc_input
        .clk(clk),            // Connect the clock signal
        .reset(reset),        // Connect the reset signal
        .out(out),      // Connect the reset signal
		  .pc_output(pc_output)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1; // Apply reset initially
        pc_input = 8'b00000000; // Set an initial value for pc_input

        // Release reset after a few clock cycles
        #10 reset = 0;

        // Monitor signals and apply test inputs
        for (int i = 0; i < 10; i = i + 1) begin
            // Apply pc_input value
            pc_input = pc_input + 1;

            // Wait for a few clock cycles
            #10;

            // Display the values of pc_input and pc_output
            
        end
        $stop;
        // Terminate the simulation
        $finish;
    end
endmodule
