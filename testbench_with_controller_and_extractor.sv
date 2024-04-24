`timescale 1ns/1ps

module testbench_with_controller_and_extractor;
    // Declare signals and wires to connect to the module
    reg re;
    reg clk;
    reg reset;
    wire jump;
    wire branch;
    wire [31:0] instruction;
    wire [31:0] rg_rd_data1;
    wire [31:0] rg_rd_data2;
    wire [31:0] ALUResult;
    wire negative;
    wire zero;
    wire [31:0] read_data;
	 wire [31:0] mux_out;
	 wire [31:0] extractor_out;
	 wire [31:0] write_data;
	 wire [31:0] store_extractor;

    // Instantiate the module under test
    with_controller_and_extractor dut (
        .re(re),
        .clk(clk),
        .reset(reset),
        .jump(jump),
        .branch(branch),
        .instruction(instruction),
        .rg_rd_data1(rg_rd_data1),
        .rg_rd_data2(rg_rd_data2),
        .ALUResult(ALUResult),
        .negative(negative),
        .zero(zero),
        .read_data(read_data),
		  .mux_out(mux_out),
		  .extractor_out(extractor_out),
		  .write_data(write_data),
		  .store_extractor(store_extractor)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Assuming a 10ns clock period
    end

    // Initialize signals
    initial begin
        
        clk = 0;
        

        // Provide a reset pulse
        reset = 1;
        #10;
		  reset = 0;
		  #250;

        // Add test cases here

        // Example: Loading an instruction into the module
        //instruction = 32'hAABBCCDD; // Replace with your instruction

        // Toggle re to initiate memory read
//        re = 1;
//        #10 re = 0;

        // Add assertions to check the module's behavior
        // Example:
        // assert (jump == 1'b0) else $display("Jump signal assertion failed.");
		  $finish;
    end

    // Add more test cases and assertions here

    // Simulation termination
//    initial begin
//        #1000; // Simulate for a sufficient period
//        $finish; // Finish simulation
//    end

endmodule
