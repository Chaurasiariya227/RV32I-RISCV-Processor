module register_file(

    input clk,
    input we,

    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    input [31:0] write_data,

    output [31:0] read_data1,
    output [31:0] read_data2

);
    // 32 registers, each 32 bits wide
    reg [31:0] registers [0:31];

    integer i;

    // Initialize all registers to zero
    initial begin
        for(i = 0; i < 32; i = i + 1)
            registers[i] = 32'd0;
    end

    // Read ports (combinational)
    assign read_data1 = registers[rs1];
    assign read_data2 = registers[rs2];

    // Write port (sequential)
    always @(posedge clk) begin
        if(we && rd != 0)
            registers[rd] <= write_data;
    end

endmodule