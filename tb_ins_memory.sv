module tb_ins_memory;

    // Parameters
    
    // Signals
    logic clk = 0;              // Clock signal
    logic [7:0] address_in;     // Address input
    logic [31:0] instruction_out; // Instruction output

    // Instantiate the ins_memory module
    ins_memory  u_ins_memory (
        .clk(clk),                // Connect the clock signal
        .address_in(address_in),  // Connect the address input
        .instruction_out(instruction_out) // Connect the instruction output
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Test stimulus
    initial begin
      
        // Initialize signals
        clk = 0;
        address_in = 0; // Start with address 0

        // Apply addresses and monitor instruction output
        for (int i = 0; i < 13; i = i + 1) begin
            #10; // Wait for a few clock cycles
            address_in = i; // Apply the address
            $display("Time = %0t, Address = %h, Instruction = %h", $time, address_in, instruction_out);
        end

        // Terminate the simulation
        $finish;
    end

endmodule
