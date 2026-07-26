`timescale 1ns/1ps

module tb_register_file;

reg clk;
reg we;

reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;

reg [31:0] write_data;

wire [31:0] read_data1;
wire [31:0] read_data2;

register_file uut(

    .clk(clk),
    .we(we),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .write_data(write_data),

    .read_data1(read_data1),
    .read_data2(read_data2)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    we = 0;

    rs1 = 0;
    rs2 = 0;
    rd = 0;
    write_data = 0;

    // Write 25 into x1
    #10;
    we = 1;
    rd = 5'd1;
    write_data = 32'd25;

    // Write 40 into x2
    #10;
    rd = 5'd2;
    write_data = 32'd40;

    // Stop writing
    #10;
    we = 0;

    // Read x1 and x2
    rs1 = 5'd1;
    rs2 = 5'd2;

    #10;

    // Try writing to x0 (should fail)
    we = 1;
    rd = 5'd0;
    write_data = 32'd999;

    #10;
    we = 0;
    rs1 = 5'd0;

    #10;

    $finish;

end

initial begin
    $monitor("Time=%0t  Read1=%d  Read2=%d  x0=%d",
             $time,
             read_data1,
             read_data2,
             uut.registers[0]);
end

endmodule