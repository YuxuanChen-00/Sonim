function filtered_value = hampel_filter(current_value, last_value, current_window, threshold)
    D = size(current_window, 1);
    
    % ���㴰���ڵ���λ����MAD����λ���ľ���ƫ�
    median_value = median(current_window,2);
    
    mad_value = median(abs(current_window-median_value),2);
    
    % ���㵱ǰ���봰����λ����ƫ��
    deviation = abs(current_value - median_value);
    
    
    % �쳣ֵ���
    filtered_value = zeros(D,1);
    for i = 1:D
        % ���ƫ�������ֵ������Ϊ���쳣��
        if deviation(i) > threshold * mad_value(i)
            filtered_value(i) = last_value(i);
            % disp([deviation(i), threshold * mad_value(i)]);
        else
            filtered_value(i) = current_value(i);
        end
    end
    % disp([size(current_value),size(last_value),size(filtered_value)])
end
