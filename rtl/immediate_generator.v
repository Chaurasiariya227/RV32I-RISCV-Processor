module immediate_generator(

    input [31:0] instruction,

    output reg [31:0] immediate

);

always @(*) begin

    case(instruction[6:0])

        // I-Type (ADDI, LW)
        7'b0010011,
        7'b0000011:
            immediate = {{20{instruction[31]}}, instruction[31:20]};

        default:
            immediate = 32'd0;

    endcase

end

endmodule