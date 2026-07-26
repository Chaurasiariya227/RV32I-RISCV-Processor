`timescale 1ns/1ps

module tb_mem_wb;

reg clk;
reg reset;

reg [31:0] memory_data_in;
reg [31:0] alu_result_in;
reg [4:0] rd_in;

reg RegWrite_in;
reg MemtoReg_in;

wire [31:0] memory_data_out;
wire [31:0] alu_result_out;
wire [4:0] rd_out;

wire RegWrite_out;
wire MemtoReg_out;

mem_wb uut(

.clk(clk),
.reset(reset),

.memory_data_in(memory_data_in),
.alu_result_in(alu_result_in),
.rd_in(rd_in),

.RegWrite_in(RegWrite_in),
.MemtoReg_in(MemtoReg_in),

.memory_data_out(memory_data_out),
.alu_result_out(alu_result_out),
.rd_out(rd_out),

.RegWrite_out(RegWrite_out),
.MemtoReg_out(MemtoReg_out)

);

always #5 clk = ~clk;

initial begin

clk = 0;
reset = 1;

#10;

reset = 0;

memory_data_in = 200;
alu_result_in = 150;
rd_in = 8;

RegWrite_in = 1;
MemtoReg_in = 1;

#10;

$display("MEM=%d ALU=%d RD=%d RegWrite=%b MemtoReg=%b",
memory_data_out,
alu_result_out,
rd_out,
RegWrite_out,
MemtoReg_out);

$finish;

end

endmodule