`timescale 1ns/1ps

module tb_instruction_memory;

reg [31:0] address;
wire [31:0] instruction;

instruction_memory uut(
    .address(address),
    .instruction(instruction)
);

initial begin

    address = 0;
    #10;

    address = 4;
    #10;

    address = 8;
    #10;

    address = 12;
    #10;

    $finish;

end

initial begin

    $monitor("Address = %d  Instruction = %h",
             address,
             instruction);

end

endmodule