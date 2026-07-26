module instruction_memory(
    input [31:0] address,
    output [31:0] instruction
);

    // Memory of 256 instructions
    reg [31:0] memory [0:255];

    // Initialize memory
    initial begin

        // add x3, x1, x2
        memory[0] = 32'h002081B3;

        // sub x4, x3, x1
        memory[1] = 32'h40118233;

        // and x5, x3, x4
        memory[2] = 32'h0041F2B3;

        // or x6, x5, x2
        memory[3] = 32'h0022E333;

    end

    // Address is byte address, so divide by 4
    assign instruction = memory[address[31:2]];

endmodule