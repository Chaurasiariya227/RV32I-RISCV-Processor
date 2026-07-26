`timescale 1ns/1ps

module tb_control_unit;

reg [6:0] opcode;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire MemtoReg;
wire [1:0] ALUOp;

control_unit uut(

    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp)

);

initial begin

    $display("-------------------------------");
    $display("Testing Control Unit");
    $display("-------------------------------");

    opcode = 7'b0110011;
    #10;
    $display("R-Type : RegWrite=%b ALUSrc=%b MemRead=%b MemWrite=%b MemtoReg=%b ALUOp=%b",
              RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, ALUOp);

    opcode = 7'b0000011;
    #10;
    $display("Load   : RegWrite=%b ALUSrc=%b MemRead=%b MemWrite=%b MemtoReg=%b ALUOp=%b",
              RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, ALUOp);

    opcode = 7'b0100011;
    #10;
    $display("Store  : RegWrite=%b ALUSrc=%b MemRead=%b MemWrite=%b MemtoReg=%b ALUOp=%b",
              RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, ALUOp);

    opcode = 7'b1100011;
    #10;
    $display("Branch : RegWrite=%b ALUSrc=%b MemRead=%b MemWrite=%b MemtoReg=%b ALUOp=%b",
              RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, ALUOp);

    $finish;

end

endmodule