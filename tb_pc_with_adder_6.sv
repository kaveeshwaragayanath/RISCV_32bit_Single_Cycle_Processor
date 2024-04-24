`timescale 1ns / 1ps

module tb_pc_with_adder_6;

  

  // Inputs
  reg ALUsrc, we, re, MemtoReg;
  reg clk, reset;
  reg [1:0] imm_src;
  reg rg_wrt_en;
  reg [3:0] Operation;

  // Outputs
  wire [31:0] ALUResult;
  wire negative, zero;
  wire [31:0] read_data;
  wire [31:0] instruction; //new
  wire [31:0] rg_rd_data1; //new 
  wire [31:0] rg_rd_data2; //new 

  // Instantiate the module under test
  pc_with_adder_6 dut (
    .ALUsrc(ALUsrc),
    .we(we),
    .re(re),
    .MemtoReg(MemtoReg),
    .clk(clk),
    .reset(reset),
    .imm_src(imm_src),
    .rg_wrt_en(rg_wrt_en),
    .Operation(Operation),
    .ALUResult(ALUResult),
    .negative(negative),
    .zero(zero),
    .read_data(read_data),
	 .instruction(instruction),//new
	 .rg_rd_data1(rg_rd_data1),//new 
	 .rg_rd_data2(rg_rd_data2) //new 
  );

  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  // Initializations
  initial begin
    // Initialize inputs
    ALUsrc = 0;
    we = 0;
    re = 1;
    MemtoReg = 1;
    clk = 0;
    reset = 1;
    imm_src = 2'b00;
    rg_wrt_en = 1;
    Operation = 4'b0010;
    #10;
	 
	 
	 
	 
    // Apply reset and wait for a few clock cycles
    
    
	 reset = 0;
	 #10;
	 #5;
	 ALUsrc = 1;
	 #10;
	 #10;
	 #10;
	 #5;
	 //reset = 0;
	 #40;
	 

    // Apply test vectors
    // You can add your test vectors here
    // Example:
    // ALUsrc = 1;
    // we = 1;
    // re = 1;
    // MemtoReg = 0;
    // imm_src = 2'b01;
    // rg_wrt_en = 1;
    // Operation = 4'b0010;

    // Simulate for a specific time

    // Finish simulation
    $finish;
  end

  // Display outputs at the end of simulation
  initial begin
    $display("Simulation finished. ALUResult = %h, negative = %b, zero = %b, read_data = %h", ALUResult, negative, zero, read_data);
  end

endmodule
