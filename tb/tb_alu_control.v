`timescale 1ns/1ps

module tb_alu_control;

reg [1:0] ALUOp;
reg [2:0] funct3;
reg [6:0] funct7;

wire [2:0] alu_control;

alu_control uut(

.ALUOp(ALUOp),
.funct3(funct3),
.funct7(funct7),
.alu_control(alu_control)

);

initial begin

// ADD
ALUOp=2'b10;
funct3=3'b000;
funct7=7'b0000000;
#10;
$display("ADD -> %b",alu_control);

// SUB
funct7=7'b0100000;
#10;
$display("SUB -> %b",alu_control);

// AND
funct7=7'b0000000;
funct3=3'b111;
#10;
$display("AND -> %b",alu_control);

// OR
funct3=3'b110;
#10;
$display("OR  -> %b",alu_control);

// XOR
funct3=3'b100;
#10;
$display("XOR -> %b",alu_control);

$finish;

end

endmodule