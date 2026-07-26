module alu_control(

    input [1:0] ALUOp,
    input [2:0] funct3,
    input [6:0] funct7,

    output reg [2:0] alu_control

);

localparam ALU_ADD = 3'b000;
localparam ALU_SUB = 3'b001;
localparam ALU_AND = 3'b010;
localparam ALU_OR  = 3'b011;
localparam ALU_XOR = 3'b100;

always @(*) begin

    case(ALUOp)

        // Load/Store -> ADD
        2'b00:
            alu_control = ALU_ADD;

        // Branch -> SUB
        2'b01:
            alu_control = ALU_SUB;

        // R-Type
        2'b10:
        begin
            case({funct7,funct3})

                {7'b0000000,3'b000}: alu_control = ALU_ADD;
                {7'b0100000,3'b000}: alu_control = ALU_SUB;
                {7'b0000000,3'b111}: alu_control = ALU_AND;
                {7'b0000000,3'b110}: alu_control = ALU_OR;
                {7'b0000000,3'b100}: alu_control = ALU_XOR;

                default:
                    alu_control = ALU_ADD;

            endcase
        end

        default:
            alu_control = ALU_ADD;

    endcase

end

endmodule