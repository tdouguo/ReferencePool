# Reference Pool

Csharp class Instance helper

- [ReferencePool.unitypackage](https://upkg.net/ReferencePool)
- [ReferencePoolExample.unitypackage](https://upkg.net/ReferencePoolExample)


# Quick start
```csharp
public class TestData : IReference
{
    public string strValue;
    public int intValue;
    public bool boolValue;

    public void Clear()
    {
        strValue = default(string);
        intValue = default(int);
        boolValue = default(bool);
    }

    public override string ToString()
    {
        return JsonUtility.ToJson(this);
        return base.ToString();
    }
}
```

```csharp
TestData td = ReferencePool.Acquire<TestData>();
td.boolValue = true;
td.intValue = int.MaxValue;
td.strValue = "测试数据";
// todo 使用
Debug.Log("使用中:" + td.ToString());


ReferencePool.Release(td); // 使用完毕
Debug.Log("使用完毕 释放:" + td.ToString());



TestData td2 = ReferencePool.Acquire<TestData>(); // 再次使用
td2.boolValue = true;
td2.intValue = int.MaxValue;
td2.strValue = "测试数据2";
// todo 使用
Debug.Log("使用中2:" + td.ToString());


ReferencePool.Release(td); // 使用完毕
Debug.Log("使用完毕2 释放:" + td.ToString());

```


# link
- [Unity Custom Packages](https://docs.unity3d.com/Manual/CustomPackages.html)
