`timescale 1ns / 1ps

module tb_pc_with_adder_3;

    // Declare signals for module inputs
    logic clk = 0;
    logic reset = 0;

    // Declare signal for module output
    logic [31:0] instruction;

    // Instantiate the DUT (Design Under Test)
    pc_with_adder_3 uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction)
    );

    // Create a clock generator
    always begin
        #5 clk = ~clk;
    end

    // Initialize signals
    initial begin
        reset = 1;
        #30; // Wait for a few clock cycles
        reset = 1'b0; // De-assert reset
		  #80;
//        // Test case: Increment pc_input by four with each clock cycle
//        for (int i = 0; i < 10; i = i + 1) begin
//            // Wait for one clock cycle
//            reset = 1'b1; // Assert reset
//            #30; // Wait for one clock cycle
//            reset = 1'b0; // De-assert reset
//				#80;
//        end

        // Finish simulation
        $finish;
    end

    // Display signals
    always @(posedge clk) begin
        $display("clk = %b, reset = %b, instruction = %h", clk, reset, instruction);
    end

endmodule
