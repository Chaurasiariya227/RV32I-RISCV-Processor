`timescale 1ns/1ps

module tb_immediate_generator;

reg [31:0] instruction;

wire [31:0] immediate;

immediate_generator uut(

.instruction(instruction),
.immediate(immediate)

);

initial begin

// ADDI x0,x0,10
instruction = 32'h00A00013;
#10;
$display("Immediate = %d", immediate);

// ADDI x0,x0,-1
instruction = 32'hFFF00013;
#10;
$display("Immediate = %d", $signed(immediate));

$finish;

end

endmodule