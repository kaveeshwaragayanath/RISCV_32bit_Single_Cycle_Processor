`timescale 1ns / 1ps

module tb_branch_unit;
    reg [2:0] funct3;
    reg Branch, zero, Con_BLT, Con_BGT;
    wire PC_Src;

    // Instantiate the branch_unit module
    branch_unit dut (
        .funct3(funct3),
        .Branch(Branch),
        .zero(zero),
        .Con_BLT(Con_BLT),
        .Con_BGT(Con_BGT),
        .PC_Src(PC_Src)
    );

    wire Con_beq, Con_bnq, Con_blt, Con_bgt;

    // Assign values to Con_beq, Con_bnq, Con_blt, and Con_bgt
    assign Con_beq = (Branch && (funct3 == 3'b000));
    assign Con_bnq = (Branch && (funct3 == 3'b001));
    assign Con_blt = (Branch && (funct3 == 3'b100 || funct3 == 3'b110));
    assign Con_bgt = (Branch && (funct3 == 3'b101 || funct3 == 3'b111));

    // Initialize inputs and perform tests
    initial begin
        // Test case 1: BEQ - Con_beq should be true, zero true
        funct3 = 3'b000;
        Branch = 1'b1;
        zero = 1'b1;
        Con_BLT = 1'b0;
        Con_BGT = 1'b0;
        #10;
        $display("Test case 1: PC_Src = %h, Con_beq = %b, Con_bnq = %b, Con_blt = %b, Con_bgt = %b", PC_Src, Con_beq, Con_bnq, Con_blt, Con_bgt);

        // Test case 2: BNE - Con_bnq should be true, zero false
        funct3 = 3'b001;
        Branch = 1'b1;
        zero = 1'b0;
        Con_BLT = 1'b1;
        Con_BGT = 1'b0;
        #10;
        $display("Test case 2: PC_Src = %h, Con_beq = %b, Con_bnq = %b, Con_blt = %b, Con_bgt = %b", PC_Src, Con_beq, Con_bnq, Con_blt, Con_bgt);

        // Test case 3: BLT (funct3=100) - Con_blt should be true, Con_BLT true
        funct3 = 3'b100;
        Branch = 1'b1;
        zero = 1'b0;
        Con_BLT = 1'b1;
        Con_BGT = 1'b0;
        #10;
        $display("Test case 3: PC_Src = %h, Con_beq = %b, Con_bnq = %b, Con_blt = %b, Con_bgt = %b", PC_Src, Con_beq, Con_bnq, Con_blt, Con_bgt);

        // Test case 4: BGE (funct3=101) - Con_blt should be true, Con_BLT false
        funct3 = 3'b101;
        Branch = 1'b1;
        zero = 1'b0;
        Con_BLT = 1'b0;
        Con_BGT = 1'b1;
        #10;
        $display("Test case 4: PC_Src = %h, Con_beq = %b, Con_bnq = %b, Con_blt = %b, Con_bgt = %b", PC_Src, Con_beq, Con_bnq, Con_blt, Con_bgt);

        // Test case 5: BLTU (funct3=110) - Con_blt should be true, Con_BLT false
        funct3 = 3'b110;
        Branch = 1'b1;
        zero = 1'b0;
        Con_BLT = 1'b0;
        Con_BGT = 1'b0;
        #10;
        $display("Test case 5: PC_Src = %h, Con_beq = %b, Con_bnq = %b, Con_blt = %b, Con_bgt = %b", PC_Src, Con_beq, Con_bnq, Con_blt, Con_bgt);

        // Test case 6: BGEU (funct3=111) - Con_blt should be true, Con_BLT false
        funct3 = 3'b111;
        Branch = 1'b1;
        zero = 1'b0;
        Con_BLT = 1'b0;
        Con_BGT = 1'b1;
        #10;
        $display("Test case 6: PC_Src = %h, Con_beq = %b, Con_bnq = %b, Con_blt = %b, Con_bgt = %b", PC_Src, Con_beq, Con_bnq, Con_blt, Con_bgt);

        // Finish the simulation
        $finish;
    end

    // Monitor output (optional)
    always @(negedge PC_Src) begin
        $display("PC_Src = %h", PC_Src);
    end
endmodule

// Simulate the design

