module mux_2bit  (
    input logic [1:0] sel, // 2-bit select input
    input logic [31:0] a,         // Input 0
    input logic [31:0] b,         // Input 1
    input logic [7:0] c,         // Input 2
    output logic [31:0] y         // Output
);

always_comb begin
    case (sel)
        2'b00: y = a;
        2'b01: y = b;
        2'b10: y = c;
        default: y = 32'bz; // Tri-state if sel is invalid
    endcase
end

endmodule
