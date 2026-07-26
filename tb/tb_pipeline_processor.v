`timescale 1ns/1ps

module tb_pipeline_processor;

reg clk;
reg reset;

pipeline_processor uut(

.clk(clk),
.reset(reset)

);

always #5 clk=~clk;

initial begin

    $dumpfile("waveforms/pipeline.vcd");
    $dumpvars(0, tb_pipeline_processor);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #80;

    $finish;

end

always @(posedge clk)

begin

$display("--------------------------------");

$display("PC          = %d",uut.pc);

$display("Instruction = %h",uut.instruction);

$display("IF/ID PC    = %d",uut.ifid_pc);

$display("IF/ID INST  = %h",uut.ifid_instruction);

end

endmodule