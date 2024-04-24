`timescale 1ns / 1ps


module pc_with_adder_5
     
    (
	  input s,
     input logic clk,reset,
	  input logic [1:0] imm_src,
	  input logic rg_wrt_en, 
	  input logic [31:0] write_data,
	  input logic [3:0] Operation,
	  output logic [31:0] ALUResult,
     output logic negative,
     output logic zero
	  
	  );
	  
	  logic [31:0] instruction;
	   logic [7:0] pc_input;
//	  logic [7:0] out;
	  logic [7:0] pc_output;
	   logic [31:0] rg_rd_data1;
      logic [31:0] rg_rd_data2;
	  logic [31:0] Imm_out;
	  logic [31:0] mux_out;
	  
	  pc pc_module (
	  .a(pc_input),
	  .clk(clk),
	  .reset(reset),
	  .y(pc_output)
	  );
	  
	  adder_8  pcadd (
	  .a(pc_output),
	  .b(8'b00000100),
	  .y(pc_input)
	  );
	  
     ins_memory ins_mem(
	  .clk(clk),
	  .address_in(pc_output),
	  .instruction_out(instruction)
	  );
	  
	  reg_filesv reg_file(
	  .clk(clk),
	  .rst(reset),
	  .rg_wrt_en(rg_wrt_en),
	  .rg_wrt_dest(instruction[11:7]),
	  .rg_rd_addr1(instruction[19:15]),
	  .rg_rd_addr2(instruction[24:20]),
	  .rg_wrt_data(write_data),
	  .rg_rd_data1(rg_rd_data1),
	  .rg_rd_data2(rg_rd_data2)
	  );
	  
	  ALU alu(
	  .SrcA(rg_rd_data1),
	  .SrcB(mux_out),
	  .Operation(Operation),
	  .ALUResult(ALUResult),
	  .negative(negative),
	  .zero(zero)
	  );
	  
	  imm_gen imm_gen(
	  .imm_src(imm_src),
	  .inst_code(instruction),
	  .Imm_out(Imm_out)
	  );
	  
	  
	  mux32 mux32(
	  .d0(Imm_out),
	  .d1(rg_rd_data2),
	  .s(s),
	  .y(mux_out)
	  );
	  
	  
	  
endmodule 