`timescale 1ns/1ps

module tb_if_id;

reg clk;
reg reset;

reg [31:0] pc_in;
reg [31:0] instruction_in;

wire [31:0] pc_out;
wire [31:0] instruction_out;

if_id uut(

.clk(clk),
.reset(reset),

.pc_in(pc_in),
.instruction_in(instruction_in),

.pc_out(pc_out),
.instruction_out(instruction_out)

);

always #5 clk = ~clk;

initial begin

clk = 0;
reset = 1;

#10;

reset = 0;

pc_in = 0;
instruction_in = 32'h002081B3;

#10;

pc_in = 4;
instruction_in = 32'h40118233;

#10;

pc_in = 8;
instruction_in = 32'h0041F2B3;

#10;

$finish;

end

always @(posedge clk)

$display("PC=%d Instruction=%h",pc_out,instruction_out);

endmodule