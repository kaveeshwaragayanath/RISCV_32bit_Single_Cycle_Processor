`timescale 1ns / 1ps

module test_imm_gen;

  // Inputs
  reg [11:0] inst_code;

  // Outputs
  wire [31:0] Imm_out;

  // Instantiate the imm_gen module
  imm_gen uut (
    .inst_code(inst_code),
    .Imm_out(Imm_out)
  );

  // Stimulus generation
  initial begin
    // Initialize test inputs
    inst_code = 12'b110110110110; // You can set your own values here

    // Add some delay before observing outputs
    #10;
    inst_code = 12'b010110110110; 
	 #10;
    // Check the output
    $display("inst_code = %b, Imm_out = %h", inst_code, Imm_out);

    // Finish the simulation
    $finish;
  end

endmodule
