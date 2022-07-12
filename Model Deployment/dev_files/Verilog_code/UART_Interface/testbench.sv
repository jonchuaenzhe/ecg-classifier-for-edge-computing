`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2022 14:30:44
// Design Name: 
// Module Name: UART_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB(

    );

    // Clock generation
    reg CLK = 0; // synchronous clk 

    // RAM declaration
    localparam width = 16;
    localparam Num_input_words = 512;
    localparam Num_output_words = 32;
    reg [width - 1 : 0] input_mem [0 : 511];
    reg [width - 1 : 0] output_mem [0 : Num_output_words - 1];

    // Memory Counter related
    integer word_cnt, packet_bit_counter;
    integer bit_ptr;
    string temp;
    string data_bit;

    // IO related
    wire uart_data_in;
    reg uart_data_out;

    myip wrapper(
        .sysclk(CLK),
        .uart_txd_in(uart_data_out),
        .uart_rxd_out(uart_data_in)
    );

    always #40 CLK = ~CLK;

    int fd, i, j;
    reg [7:0] data_packet;
    initial begin
        fd = $fopen("Input_mem.mem", "r");
        #80 // wait for 1 period so that it is easier to read on the waveform

        while (word_cnt < Num_input_words) begin
            $fgets(temp, fd);
            word_cnt = word_cnt + 1;

            for (i = 0; i < temp.len()-1 ; i ++) begin
                uart_data_out = 0; // start bit
                packet_bit_counter = 0;
                // wait for one cycle
                #104166;

                // get that bit of data
                if (i + 1 < temp.len()) begin
                    data_bit = temp.substr(i, i + 1);
                end
                
                // ASCII encode that data
                case (data_bit)
                    "-": data_packet = 8'h2D;
                    "0": data_packet = 8'h30;
                    "1": data_packet = 8'h31;
                    "2": data_packet = 8'h32;
                    "3": data_packet = 8'h33;
                    "4": data_packet = 8'h34;
                    "5": data_packet = 8'h35;
                    "6": data_packet = 8'h36;
                    "7": data_packet = 8'h37;
                    "8": data_packet = 8'h38;
                    "9": data_packet = 8'h39;
                endcase

                // iteratively send data bit by bit
                while (packet_bit_counter < 8) begin
                    uart_data_out = data_packet[packet_bit_counter];
                    packet_bit_counter = packet_bit_counter + 1;
                    #104166;
                end

                // send stop bit
                uart_data_out = 1;
                #104166;
            end 

            // send return
            uart_data_out = 0; // start bit
            $104166; // start bit

            data_packet = 8'hD;
            packet_bit_counter = 0;
            // iteratively send data bit by bit
            while (packet_bit_counter < 8) begin
                uart_data_out = data_packet[packet_bit_counter];
                packet_bit_counter = packet_bit_counter + 1;
                #104166;
            end

            // send stop bit
            uart_data_out = 1;
            #104166;
        end

        // while (!$feof(fd)) begin
        //     $fgets(temp, fd);
        //     $display("Line is %s", temp);
        //     $display(temp.substr(1,0));
        //     // $display("Corresponding ASCII is %d", temp.atoi());
        // end

        $fclose(fd);

        // $fgets(temp, fd);
        // $display (temp);
    end

    // always
    //     #40 CLK = ~CLK;
        
    //     initial begin
    //         $display("Loading Memory");
    //         $readmemh("Input_mem.mem", input_mem);

    //         #80 // wait for 1 period so that it is easier to read on the waveform

    //         while (word_cnt < Num_input_words) begin
    //             temp = string'(input_mem[word_cnt]);
    //             $display(temp.atoi());
    //             word_cnt = word_cnt + 1;
    //         end

    //         // Transmit data via uart one by one
    //         word_cnt = 0;  
    //         uart_data_out = 1; // hold the line high

    //         while (word_cnt < Num_input_words) begin
    //             packet_bit_counter = 0;

    //             // send start bit
    //             uart_data_out = 0;

    //             // wait for one cycle
    //             #104166;

    //             // iteratively send data bit by bit
    //             while (packet_bit_counter < 8) begin
    //                 uart_data_out = input_mem[word_cnt][packet_bit_counter];
    //                 packet_bit_counter = packet_bit_counter + 1;
    //                 #104166;
    //             end

    //             // send stop bit
    //             uart_data_out = 1;
    //             #104166;

    //             word_cnt = word_cnt + 1;
    //         end

    //         #40; // wait for half a cycle

    //         word_cnt = 0;
    //         while (word_cnt < Num_output_words) begin
                

    //             output_mem[word_cnt] <= uart_data_out;
    //         end
    //     end



endmodule
