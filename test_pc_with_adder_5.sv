`timescale 1ns / 1ps

module test_pc_with_adder_5;

  // Inputs
  reg clk;
  reg reset;
  reg rg_wrt_en;
  reg [31:0] write_data;
  reg [3:0] Operation;

  // Outputs
  wire [31:0] ALUResult;
  wire negative;
  wire zero;

  // Instantiate the pc_with_adder_5 module
  pc_with_adder_5 pc_with_adder_5_inst (
    .clk(clk),
    .reset(reset),
    .rg_wrt_en(rg_wrt_en),
    .write_data(write_data),
    .Operation(Operation),
    .ALUResult(ALUResult),
    .negative(negative),
    .zero(zero)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  // Reset handling
  initial begin
    
    
    reset = 0;
	 #10;
  end

  // Stimulus generation
  initial begin
    reset = 0;
    Operation = 4'b0010;
    // Initialize your test inputs here
    // Example:
    rg_wrt_en = 1;
    write_data = 32'h12345678;
	 #10;
	 write_data = 32'h00000001;
	 #10;
	 
     // Example Operation value

    // Apply more test cases as needed

    // Add some delay before observing outputs
    #10;

    // Check the outputs
    $display("ALUResult = %h, negative = %b, zero = %b", ALUResult, negative, zero);

    // Finish the simulation
    $finish;
  end

endmodule
