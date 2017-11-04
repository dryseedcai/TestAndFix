package com.dryseed.testandfix.application;

import android.app.Application;

import com.dryseed.testandfix.andfix.AndFixPatchManager;

/**
 * Created by User on 2017/11/4.
 */
public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();

        AndFixPatchManager.getInstance().initPatch(this);
    }
}
