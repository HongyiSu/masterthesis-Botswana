function my_spectrum(data_syn_d_f,data_obs_d_f, station, chan,fs_syn,fs_obs,j,k)
     
     ns_syn = length(data_syn_d_f);
     f_syn = fs_syn*(0:ns_syn/2)/ns_syn;%sample individual frequency
     F_syn=fft(data_syn_d_f);%perform Fourier Transformation with fft
     A_syn=abs(F_syn(1:ns_syn/2+1));%take absolute value
     ns_obs = length(data_obs_d_f);
     f_obs = fs_obs*(0:ns_obs/2)/ns_obs;
     F_obs=fft(data_obs_d_f);
     A_obs=abs(F_obs(1:ns_obs/2+1));

     loglog(f_obs,A_obs, 'r');

    % ylim([10^-8 10^2]);
    hold on

    loglog(f_syn,A_syn, 'k');
    %ylim([10^-14 10^-6])
    
    xlim([0 10^2])
    
    if(j==7)
        xticks([10^-4 10^-2 10^-1 10^0 10^1 10^2]);
        xlabel('Frequency[Hz]','FontSize', 16,'Fontweight','bold');
        %a = get(gca,'XTickLabel');  
        %set(gca,'XTickLabel',a,'fontsize',18,'FontWeight','bold')
        %set(gca,'XTickLabelMode','auto');
        a = get(gca,'XTickLabel');  
        set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')
        set(gca,'XTickLabelMode','auto');
    elseif(j==1)
        title(strcat("BH",chan),'FontSize', 12,'fontweight','bold')
        set(gca,'Xticklabel',[])
    else
        set(gca,'Xticklabel',[])
    end

    if(k==1)
        ylim([10^-6, 10^1])
        yticks([10^-6 10^-4 10^-2 10^0]);
        ylabel(station,'FontSize', 20,'fontweight','bold')
        
        a = get(gca,'YTickLabel');  
        set(gca,'YTickLabel',a,'fontsize',12,'FontWeight','bold')
        set(gca,'YTickLabelMode','auto');
    else
        yticks([]);
        set(gca,'YColor','none')
    end

    set(gca,'box','off')
    set(gcf,'color','w');
    grid on
    set(gca,'YGrid', 'off')
    set(gca, 'xminorgrid', 'on')
    set(gca,'MinorGridLineStyle','-')
    set(gca,'GridLineStyle','-')
end