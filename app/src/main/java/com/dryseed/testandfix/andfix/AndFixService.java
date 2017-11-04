package com.dryseed.testandfix.andfix;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.support.annotation.Nullable;
import android.text.TextUtils;

import java.io.File;

/**
 * Created by User on 2017/11/4.
 * <p/>
 * 1. 检查patch文件
 * 2. 下载patch文件
 * 3. 加载下载好的patch文件
 */
public class AndFixService extends Service {
    private static final String TAG = "MMM";
    private static final int UPDATE_PATCH = 0X02;
    private static final int DOWNLOAD_PATCH = 0X01;
    private static final String FILE_EXTENSION = ".apatch";

    private String mBasePathInfo;
    private String mPathFileDir;
    private String mPathFile;
    private Handler mHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what){
                case UPDATE_PATCH:
                    checkPatchUpdate();
                    break;
                case DOWNLOAD_PATCH:
                    downloadPatch();
                    break;
                default:
                    break;
            }
        }
    };

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        init();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (null != mHandler) {
            mHandler.sendEmptyMessage(UPDATE_PATCH);
        }
        return START_NOT_STICKY; //被系统回收后不会自动重启
    }

    private void init() {
        mPathFileDir = getExternalCacheDir().getAbsolutePath() + "/apatch/";
        File patchDir = new File(mPathFileDir);
        if (patchDir == null) {
            stopSelf();
            return;
        }
        try {
            if (!patchDir.exists()) {
                patchDir.mkdir();
            }
        } catch (Exception e) {
            e.printStackTrace();
            stopSelf();
        }
    }

    /**
     * 检查服务器是否有patch文件
     */
    private void checkPatchUpdate() {
        /*RestClient.builder()
                .url(RequestData.ADDRESS.name())
                .loader(getContext())
                .success(this)
                .build()
                .get();*/

        //onSuccess
        mBasePathInfo = "not null"; //get from server
        if(!TextUtils.isEmpty(mBasePathInfo)){
            mHandler.sendEmptyMessage(DOWNLOAD_PATCH);
        } else {
            stopSelf();
        }
    }

    /**
     * 从服务器下载patch文件
     */
    private void downloadPatch() {
        mPathFile = mPathFileDir.concat(String.valueOf(System.currentTimeMillis())).concat(FILE_EXTENSION);
        /*RestClient.builder()
                .url(mBasePathInfo)
                .dir(mPathFile)
                .loader(getContext())
                .success(this)
                .build()
                .download();*/

        //onSuccess
        AndFixPatchManager.getInstance().addPatch(mPathFile);
    }
}
