package com.dryseed.testandfix.andfix;

import android.content.Context;

import com.alipay.euler.andfix.patch.PatchManager;
import com.dryseed.testandfix.utils.Utils;

import java.io.IOException;

/**
 * Created by User on 2017/11/4.
 * <p>
 * AndFix api : https://github.com/alibaba/AndFix
 */
public class AndFixPatchManager {

    private PatchManager mPatchManager;

    private AndFixPatchManager() {

    }

    private static class AndFixPatchManagerHolder {
        private static AndFixPatchManager instance = new AndFixPatchManager();
    }

    public static AndFixPatchManager getInstance() {
        return AndFixPatchManagerHolder.instance;
    }

    public void initPatch(Context context) {
        mPatchManager = new PatchManager(context);
        mPatchManager.init(Utils.getVersionName(context)); //current version
        mPatchManager.loadPatch();
    }

    public void addPatch(String path) {
        if (null != mPatchManager) {
            try {
                mPatchManager.addPatch(path);//path of the patch file that was downloaded
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
