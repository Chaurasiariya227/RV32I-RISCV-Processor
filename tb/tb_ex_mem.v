`timescale 1ns/1ps

module tb_ex_mem;

reg clk;
reg reset;

reg [31:0] alu_result_in;
reg [31:0] write_data_in;
reg [4:0] rd_in;

reg RegWrite_in;
reg MemRead_in;
reg MemWrite_in;
reg MemtoReg_in;

wire [31:0] alu_result_out;
wire [31:0] write_data_out;
wire [4:0] rd_out;

wire RegWrite_out;
wire MemRead_out;
wire MemWrite_out;
wire MemtoReg_out;

ex_mem uut(

.clk(clk),
.reset(reset),

.alu_result_in(alu_result_in),
.write_data_in(write_data_in),
.rd_in(rd_in),

.RegWrite_in(RegWrite_in),
.MemRead_in(MemRead_in),
.MemWrite_in(MemWrite_in),
.MemtoReg_in(MemtoReg_in),

.alu_result_out(alu_result_out),
.write_data_out(write_data_out),
.rd_out(rd_out),

.RegWrite_out(RegWrite_out),
.MemRead_out(MemRead_out),
.MemWrite_out(MemWrite_out),
.MemtoReg_out(MemtoReg_out)

);

always #5 clk = ~clk;

initial begin

clk = 0;
reset = 1;

#10;
reset = 0;

alu_result_in = 100;
write_data_in = 50;
rd_in = 7;

RegWrite_in = 1;
MemRead_in = 0;
MemWrite_in = 1;
MemtoReg_in = 0;

#10;

$display("ALU=%d WriteData=%d RD=%d RegWrite=%b MemWrite=%b",
alu_result_out,
write_data_out,
rd_out,
RegWrite_out,
MemWrite_out);

$finish;

end

endmodule