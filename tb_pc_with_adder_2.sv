`timescale 1ns / 1ps

module tb_pc_with_adder_2;

    // Signals
    logic clk = 0;                     // Clock signal
    logic reset = 0;                   // Reset signal
    logic [7:0] pc_input ;    // Initial value for pc_input
    logic [31:0] instruction;          // Output signal to monitor
    
	  
    // Instantiate the pc_with_adder module
    pc_with_adder u_pc_with_adder (
        .pc_input(pc_input),           // Connect the input signal pc_input
        .clk(clk),                     // Connect the clock signal
        .reset(reset),                 // Connect the reset signal
        .instruction(instruction)      // Connect the output signal instruction
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
		  pc_input = 8'b0000;

        // Release reset after a few clock cycles
        #10 reset = 0;

        // Loop to test different pc_input values
        for (int i = 0; i < 256; i = i + 1) begin
            // Apply a new pc_input value
            pc_input = i;

            // Monitor instruction signal
            

            // Wait for a few clock cycles between inputs
            #10;
        end
		  $stop;

        // Terminate the simulation
        $finish;
    end
endmodule
