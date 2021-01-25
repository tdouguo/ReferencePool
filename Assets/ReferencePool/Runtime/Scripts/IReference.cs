//------------------------------------------------------------
// ReferencePool
// Copyright © 2021 tdouguo. All rights reserved.
// Homepage: https://www.tdouguo.com/
// Mainto: tdouguo@gmail.com
//------------------------------------------------------------

namespace ReferencePool
{
    /// <summary>
    /// 引用接口。
    /// </summary>
    public interface IReference
    {
        /// <summary>
        /// 清理引用。
        /// </summary>
        void Clear();
    }
}
