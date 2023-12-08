function videoslicer
    [filename, pathname] = uigetfile({'*.mp4;*.avi;*.mkv;*.mj2;*.mpg;*.wmv;*.asf;*.m4v;*.mov', 'Video Files (*.mp4;*.avi;*.mkv;*.mj2;*.mpg;*.wmv;*.asf;*.m4v;*.mov)'});
    video = VideoReader(fullfile(pathname, filename));
    counter=1;
    formats= {'.jpg','.jpeg','.png','.tiff'};
    format=formats(1);
    selectedPath = uigetdir;
    while hasFrame(video)
        frame = readFrame(video);
        pic_name = string(counter) + format;
        imwrite(gpuArray(frame),fullfile(selectedPath, pic_name));
        counter=counter+1;
    end
end