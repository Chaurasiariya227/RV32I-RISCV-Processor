`timescale 1ns/1ps

module tb_processor;

reg clk;
reg reset;

processor uut(

    .clk(clk),
    .reset(reset)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;

    reset = 0;

    #100;

    $finish;

end

always @(posedge clk) begin

    $display("---------------------------------------");
    $display("PC = %d", uut.pc);
    $display("Instruction = %h", uut.instruction);
    $display("ALU Result = %d", uut.alu_result);

end

endmodule