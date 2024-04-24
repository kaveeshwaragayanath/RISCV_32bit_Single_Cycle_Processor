
`timescale 1ns / 1ps


module final_data_path_02
     
    (
	  
     input logic clk,reset,
	  output logic jump,
	  output logic branch,
	  output logic [31:0] instruction, //new
	  output logic [31:0] rg_rd_data1, //new
	  output logic [31:0] rg_rd_data2, //new 
	 
	  output logic [31:0] ALUResult,
     //output logic negative,
     output logic zero,
	  output logic [31:0] read_data,
	  output logic [31:0] extractor_out,
	  output logic [31:0] mux_out, //new
	  output logic [31:0] write_data, //new
	  output logic [7:0] pc_output,
	  output logic [31:0]  store_extractor
	  );
	   //logic [31:0] write_data;
		logic Con_BGT;
		logic Con_BLT;
	   logic  ALUsrc;
		logic [1:0] MemtoReg;
		logic rg_wrt_en;
		logic [1:0] aluop;
		logic [3:0] Operation;
	   logic [1:0] imm_src;
	   logic we;
	   logic [7:0] pc_input;
		logic [7:0] pc_plus_4;
		logic PC_src;
		
	
//	  logic [7:0] out;
	  //logic [7:0] pc_output;
	  logic [7:0] ext_imm;
	   //logic [31:0] rg_rd_data1;
     // logic [31:0] rg_rd_data2;
	  logic [31:0] Imm_out;
	  //logic [31:0] mux_out;
	  //logic [31:0] extractor_out
	  
	  pc pc_module (
	  .a(pc_input),
	  .clk(clk),
	  .reset(reset),
	  .y(pc_output)
	  );
	  
	  adder_8  pcadd (
	  .a(pc_output),
	  .b(8'b00000100),
	  .y(pc_plus_4)
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
	  .Con_BLT(Con_BLT),
	  .Con_BGT(Con_BGT),
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
	  .s(ALUsrc),
	  .y(mux_out)
	  );
	  
	  data_mem data_memory(
	  .we(we),
     .clk(clk),
     .write_data(store_extractor),
     .address(ALUResult),
     .read_data(read_data)
	  );
	  
	  mux_2bit muxx(
	  .a(ALUResult),
	  .b(extractor_out),
	  .c(pc_plus_4),
	  .sel(MemtoReg),
	  .y(write_data)
	  );
	  
	  
	  
//	  mux32 muxxx(
//	  .d0(ALUResult),
//	  .d1(extractor_out),
//	  .s(MemtoReg),
//	  .y(write_data)
//	  );
//	  
	  main_controller main_controller(
	  .Opcode(instruction[6:0]),
	  .ALUSrc(ALUsrc),
	  .Result_Src(MemtoReg),
	  .RegWrite(rg_wrt_en),
	  .Imm_Src(imm_src),
	  .MemWrite(we),
	  .ALUOp(aluop),
	  .jump(jump),
	  .Branch(branch)
	  );
	  
	  alu_dec alu_decoder(
	  .f7b5(instruction[30]),
	  .op5(instruction[5]),
	  .func3(instruction[14:12]),
	  .aluop(aluop),
	  .alucontrol(Operation)
	  );
	  
	  data_extractor_for_load extractor_01(
	  .inst(instruction[31:0] ),
	  .data(read_data),
	  .y(extractor_out)
	  );
	  
	  data_extractor_for_store extractor_02(
	  .inst(instruction[31:0] ),
	  .data(rg_rd_data2),
	  .y(store_extractor)
	  );
	  
	  adder_8 adder_branch(
	  .a(pc_output),
	  .b(Imm_out[7:0]),
	  .y(ext_imm)
	  );
	  
	  mux2 select_branch(
	  .d0(ext_imm),
	  .d1(pc_plus_4),
	  .s(PC_src),
	  .y(pc_input)
	  );
	  
	  branch_unit branch_unit(
	  .funct3(instruction[14:12]),
	  .Branch(branch),
	  .zero(zero),
	  .jump(jump),
	  .Con_BLT(Con_BLT),
	  .Con_BGT(Con_BGT),
	  .PC_Src(PC_src)
	  );
	  
endmodule 