`timescale 1ns / 1ps

module tb_data_extractor_for_store;
    reg [31:0] inst, data;
    wire [31:0] y;

    // Instantiate the data_extractor_for_store module
    data_extractor_for_store dut (
        .inst(inst),
        .data(data),
        .y(y)
    );

    // Initialize inputs and perform tests
    initial begin
        // Test case 1: Store Byte (SB) - should store the low byte of data
        inst = 32'b0000000_00000_00101_000_00000_0100011;  // SB instruction, func3=0
        data = 32'hA5F0B376;  // Example data
        #10;
		   inst = 32'b0000000_00000_00101_001_00000_0100011;  // SH instruction, func3=1
         data = 32'hA5F0B376;  // Example data
         #10;
         inst = 32'b0000000_00000_00101_010_00000_0100011;  // SW instruction, func3=2
         data = 32'hA5F0B376;  // Random data
        #10;

        // Test case 5: Default case - should return 32'b0
        inst = 32'h1111111_11111_11111_111_11111_1111111;  // Default case
        data = 32'hA5F0B376;  // Example data
        #10;

        // Finish the simulation
        $finish;
    end

    // Monitor outputs (optional)
    always @(negedge y) begin
        $display("y = %h", y);
        // Add other monitored signals here
    end
endmodule

// Simulate the design
