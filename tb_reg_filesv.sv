`timescale 1ns / 1ps

module tb_reg_filesv;

    // Declare signals for module inputs
    logic clk = 0;
    logic rst = 0;
    logic rg_wrt_en = 0;
    logic [4:0] rg_wrt_dest;
    logic [4:0] rg_rd_addr1;
    logic [4:0] rg_rd_addr2;
    logic [31:0] rg_wrt_data;

    // Declare signals for module outputs
    logic [31:0] rg_rd_data1;
    logic [31:0] rg_rd_data2;

    // Instantiate the DUT (Design Under Test)
    reg_filesv uut (
        .clk(clk),
        .rst(rst),
        .rg_wrt_en(rg_wrt_en),
        .rg_wrt_dest(rg_wrt_dest),
        .rg_rd_addr1(rg_rd_addr1),
        .rg_rd_addr2(rg_rd_addr2),
        .rg_wrt_data(rg_wrt_data),
        .rg_rd_data1(rg_rd_data1),
        .rg_rd_data2(rg_rd_data2)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initialize signals
    initial begin
        rst = 1;
        rg_wrt_en = 0;
        rg_wrt_dest = 5'b0;
        rg_rd_addr1 = 5'b0;
        rg_rd_addr2 = 5'b0;
        rg_wrt_data = 32'h00000000;

        // Release reset
        #10;
        rst = 0;

        // Test cases
        // Write to register file
        rg_wrt_en = 1;
        rg_wrt_dest = 5'b00100; // Write to register 4
        rg_wrt_data = 32'h12345678;
        #10; // Allow some time for the operation to complete
        rg_wrt_en = 0;

        // Read from register file
        rg_rd_addr1 = 5'b00100; // Read from register 4
        rg_rd_addr2 = 5'b00001; // Read from register 1
        #10; // Allow some time for the operation to complete

        // Add more test cases as needed
        $stop;
        // Finish simulation
        $finish;
    end

    // Display signals
    

endmodule
