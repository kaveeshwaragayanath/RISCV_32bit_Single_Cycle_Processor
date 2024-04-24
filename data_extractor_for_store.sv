`timescale 1ns / 1ps





module data_extractor_for_store (
    input logic [31:0] inst,
    input logic [31:0] data,
    output logic [31:0] y
);
    logic [15:0] s_bit;
    logic [7:0] e_bit;
    
    assign s_bit = data[15:0];
    assign e_bit = data[7:0];
    
    always_comb begin
        case(inst[6:0])
             7'b0100011:
                case(inst[14:12])
                    3'b000: y = {e_bit[7] ? {24{1'b1}} : {24{1'b0}}, e_bit};
                    3'b001: y = {s_bit[15] ? {16{1'b1}} : {16{1'b0}}, s_bit};
                    
                    3'b010: y = data;
                    default: y = 32'b0; // You can assign a default value if needed
                endcase
            default:
                y = data;
        endcase
    end
endmodule

