`timescale 1ns/1ps

module tb_forwarding_unit;

reg EX_MEM_RegWrite;
reg MEM_WB_RegWrite;

reg [4:0] EX_MEM_rd;
reg [4:0] MEM_WB_rd;

reg [4:0] ID_EX_rs1;
reg [4:0] ID_EX_rs2;

wire [1:0] ForwardA;
wire [1:0] ForwardB;

forwarding_unit uut(

.EX_MEM_RegWrite(EX_MEM_RegWrite),
.MEM_WB_RegWrite(MEM_WB_RegWrite),

.EX_MEM_rd(EX_MEM_rd),
.MEM_WB_rd(MEM_WB_rd),

.ID_EX_rs1(ID_EX_rs1),
.ID_EX_rs2(ID_EX_rs2),

.ForwardA(ForwardA),
.ForwardB(ForwardB)

);

initial begin

EX_MEM_RegWrite = 1;
MEM_WB_RegWrite = 1;

EX_MEM_rd = 5;
MEM_WB_rd = 6;

ID_EX_rs1 = 5;
ID_EX_rs2 = 6;

#10;

$display("ForwardA=%b ForwardB=%b",ForwardA,ForwardB);

$finish;

end

endmodule