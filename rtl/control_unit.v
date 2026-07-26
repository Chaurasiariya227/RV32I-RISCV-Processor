module control_unit(

    input [6:0] opcode,

    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg [1:0] ALUOp

);

always @(*) begin

    // Default values
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    ALUSrc = 0;
    MemtoReg = 0;
    ALUOp = 2'b00;

    case(opcode)

        // R-Type Instructions
        7'b0110011: begin
            RegWrite = 1;
            ALUSrc = 0;
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;
            ALUOp = 2'b10;
        end

        // Load (LW)
        7'b0000011: begin
            RegWrite = 1;
            ALUSrc = 1;
            MemRead = 1;
            MemWrite = 0;
            MemtoReg = 1;
            ALUOp = 2'b00;
        end

        // Store (SW)
        7'b0100011: begin
            RegWrite = 0;
            ALUSrc = 1;
            MemRead = 0;
            MemWrite = 1;
            MemtoReg = 0;
            ALUOp = 2'b00;
        end

        // Branch (BEQ)
        7'b1100011: begin
            RegWrite = 0;
            ALUSrc = 0;
            MemRead = 0;
            MemWrite = 0;
            MemtoReg = 0;
            ALUOp = 2'b01;
        end

    endcase

end

endmodule