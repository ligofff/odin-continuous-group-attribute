using System;

namespace OdinContinuousGroup
{
    public class ContinuousGroupAttribute : Attribute
    {
        public string tabName;
        public GroupType groupType;

        public ContinuousGroupAttribute(string tabName, GroupType groupType = GroupType.BoxGroup)
        {
            this.tabName = tabName;
            this.groupType = groupType;
        }
    }

    public enum GroupType
    {
        TabGroup,
        BoxGroup,
        TitleGroup,
        FoldoutGroup,
        HorizontalGroup,
        VerticalGroup
    }
    
    public class ContinuousGroupEndAttribute : Attribute
    {
        
    }
}