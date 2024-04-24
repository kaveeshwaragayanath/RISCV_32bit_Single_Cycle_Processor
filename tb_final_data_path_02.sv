`timescale 1ns / 1ps

module tb_final_data_path_02;
    reg  clk, reset;
    wire jump, branch,  zero;
    reg [31:0] instruction, rg_rd_data1, rg_rd_data2, ALUResult, read_data, extractor_out, mux_out, write_data, store_extractor;
    reg [7:0] pc_output;
    // Instantiate the final_data_path module
    final_data_path_02 dut (
        
        .clk(clk),
        .reset(reset),
        .jump(jump),
        .branch(branch),
        .instruction(instruction),
        .rg_rd_data1(rg_rd_data1),
        .rg_rd_data2(rg_rd_data2),
        .ALUResult(ALUResult),
        
        .zero(zero),
        .read_data(read_data),
        .extractor_out(extractor_out),
        .mux_out(mux_out),
        .write_data(write_data),
        .store_extractor(store_extractor),
		  .pc_output(pc_output)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initialize inputs
    initial begin
        clk = 0;
        reset = 0;
        
        // Initialize other inputs here
        //instruction = 32'h01234567;  // Example instruction
        // Set other inputs as needed

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Apply test vectors
        // You can apply test vectors by changing inputs over time
        // For example:
        // instruction = 32'h00000000;  // Set a different instruction
        // re = 1;  // Set re to 1
        // #10 re = 0;  // After some time, set re back to 0

        // You can continue applying test vectors as needed

        // Simulate for a period
        #360;

        // Finish the simulation
        $finish;
    end

    // Monitor outputs (optional)
    always @(negedge clk) begin
        $display("ALUResult = %h", ALUResult);
        // Add other monitored signals here
    end
endmodule

// Add module instantiations for submodules (e.g., pc, ins_memory, reg_file, etc.)

// Run the simulation



