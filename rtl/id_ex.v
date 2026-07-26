module id_ex(

    input clk,
    input reset,

    input [31:0] pc_in,
    input [31:0] read_data1_in,
    input [31:0] read_data2_in,
    input [31:0] immediate_in,

    input [4:0] rd_in,

    input RegWrite_in,
    input MemRead_in,
    input MemWrite_in,
    input ALUSrc_in,
    input MemtoReg_in,

    input [2:0] alu_control_in,

    output reg [31:0] pc_out,
    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out,
    output reg [31:0] immediate_out,

    output reg [4:0] rd_out,

    output reg RegWrite_out,
    output reg MemRead_out,
    output reg MemWrite_out,
    output reg ALUSrc_out,
    output reg MemtoReg_out,

    output reg [2:0] alu_control_out

);

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        pc_out <= 0;
        read_data1_out <= 0;
        read_data2_out <= 0;
        immediate_out <= 0;
        rd_out <= 0;

        RegWrite_out <= 0;
        MemRead_out <= 0;
        MemWrite_out <= 0;
        ALUSrc_out <= 0;
        MemtoReg_out <= 0;

        alu_control_out <= 0;
    end

    else
    begin
        pc_out <= pc_in;
        read_data1_out <= read_data1_in;
        read_data2_out <= read_data2_in;
        immediate_out <= immediate_in;
        rd_out <= rd_in;

        RegWrite_out <= RegWrite_in;
        MemRead_out <= MemRead_in;
        MemWrite_out <= MemWrite_in;
        ALUSrc_out <= ALUSrc_in;
        MemtoReg_out <= MemtoReg_in;

        alu_control_out <= alu_control_in;
    end

end

endmodule