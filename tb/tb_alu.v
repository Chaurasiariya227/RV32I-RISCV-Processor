`timescale 1ns/1ps

module tb_alu;

reg [31:0] a;
reg [31:0] b;
reg [2:0] alu_control;

wire [31:0] result;

alu uut(
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .result(result)
);

task check;

input [31:0] expected;

begin

    #5;

    if(result == expected)
        $display("PASS  Result = %d", result);

    else
        $display("FAIL  Expected = %d  Got = %d", expected, result);

end

endtask

initial begin

    //--------------------------------
    // ADD
    //--------------------------------
    a = 20;
    b = 5;
    alu_control = 3'b000;
    check(25);

    //--------------------------------
    // SUB
    //--------------------------------
    a = 20;
    b = 5;
    alu_control = 3'b001;
    check(15);

    //--------------------------------
    // AND
    //--------------------------------
    a = 12;
    b = 10;
    alu_control = 3'b010;
    check(8);

    //--------------------------------
    // OR
    //--------------------------------
    a = 12;
    b = 10;
    alu_control = 3'b011;
    check(14);

    //--------------------------------
    // XOR
    //--------------------------------
    a = 12;
    b = 10;
    alu_control = 3'b100;
    check(6);

    $finish;

end

endmodule