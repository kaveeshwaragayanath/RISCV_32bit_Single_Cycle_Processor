`timescale 1ns / 1ps

module tb_adder_8;
    // Signals
    logic [7:0] a;      // Input signal a
    logic [7:0] b;      // Input signal b
    logic [7:0] y;      // Output signal y

    // Instantiate the adder_8 module
    adder_8 u_adder_8 (
        .a(a),            // Connect input signal a
        .b(b),            // Connect input signal b
        .y(y)             // Connect output signal y
    );

    // Test stimulus
    initial begin
        // Test cases
        a = 8'h00;  // Example input values
        b = 8'h01;
        #10;
       

        a = 8'h0A;  // Another test case
        b = 8'h0B;
        #10;
        
        // You can add more test cases here as needed
        $stop;
        // Terminate the simulation
        $finish;
    end
endmodule
