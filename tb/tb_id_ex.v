`timescale 1ns/1ps

module tb_id_ex;

reg clk;
reg reset;

reg [31:0] pc_in;
reg [31:0] read_data1_in;
reg [31:0] read_data2_in;
reg [31:0] immediate_in;

reg [4:0] rd_in;

reg RegWrite_in;
reg MemRead_in;
reg MemWrite_in;
reg ALUSrc_in;
reg MemtoReg_in;

reg [2:0] alu_control_in;

wire [31:0] pc_out;
wire [31:0] read_data1_out;
wire [31:0] read_data2_out;
wire [31:0] immediate_out;

wire [4:0] rd_out;

wire RegWrite_out;
wire MemRead_out;
wire MemWrite_out;
wire ALUSrc_out;
wire MemtoReg_out;

wire [2:0] alu_control_out;

id_ex uut(

.clk(clk),
.reset(reset),

.pc_in(pc_in),
.read_data1_in(read_data1_in),
.read_data2_in(read_data2_in),
.immediate_in(immediate_in),

.rd_in(rd_in),

.RegWrite_in(RegWrite_in),
.MemRead_in(MemRead_in),
.MemWrite_in(MemWrite_in),
.ALUSrc_in(ALUSrc_in),
.MemtoReg_in(MemtoReg_in),

.alu_control_in(alu_control_in),

.pc_out(pc_out),
.read_data1_out(read_data1_out),
.read_data2_out(read_data2_out),
.immediate_out(immediate_out),

.rd_out(rd_out),

.RegWrite_out(RegWrite_out),
.MemRead_out(MemRead_out),
.MemWrite_out(MemWrite_out),
.ALUSrc_out(ALUSrc_out),
.MemtoReg_out(MemtoReg_out),

.alu_control_out(alu_control_out)

);

always #5 clk = ~clk;

initial begin

clk=0;
reset=1;

#10;
reset=0;

pc_in=4;
read_data1_in=25;
read_data2_in=40;
immediate_in=12;
rd_in=5;

RegWrite_in=1;
MemRead_in=0;
MemWrite_in=0;
ALUSrc_in=1;
MemtoReg_in=0;

alu_control_in=3'b000;

#10;

$display("PC=%d RD=%d A=%d B=%d IMM=%d ALU=%b",
pc_out,rd_out,read_data1_out,read_data2_out,immediate_out,alu_control_out);

$finish;

end

endmodule