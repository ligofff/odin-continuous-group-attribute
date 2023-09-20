using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Sirenix.OdinInspector;
using Sirenix.OdinInspector.Editor;

namespace OdinContinuousGroup
{
    public class BeginAndEndGroupAttributeProcessor<T> : OdinAttributeProcessor<T>
    {
        private ContinuousGroupAttribute _groupStartsFrom;
        
        public override void ProcessChildMemberAttributes(InspectorProperty parentProperty, MemberInfo member, List<Attribute> attributes)
        {
            if (attributes.OfType<ContinuousGroupAttribute>().FirstOrDefault() is {} startAttribute)
            {
                _groupStartsFrom = startAttribute;
            }
            
            if (attributes.OfType<ContinuousGroupEndAttribute>().FirstOrDefault() is {} endAttribute)
            {
                _groupStartsFrom = null;
            }

            if (_groupStartsFrom is { })
            {
                PropertyGroupAttribute propertyGroupAttribute;

                switch (_groupStartsFrom.groupType)
                {
                    case GroupType.TabGroup:
                        propertyGroupAttribute = new TabGroupAttribute(_groupStartsFrom.tabName);
                        break;
                    case GroupType.BoxGroup:
                        propertyGroupAttribute = new BoxGroupAttribute(_groupStartsFrom.tabName);
                        break;
                    case GroupType.TitleGroup:
                        propertyGroupAttribute = new TitleGroupAttribute(_groupStartsFrom.tabName);
                        break;
                    case GroupType.FoldoutGroup:
                        propertyGroupAttribute = new FoldoutGroupAttribute(_groupStartsFrom.tabName);
                        break;
                    case GroupType.HorizontalGroup:
                        propertyGroupAttribute = new HorizontalGroupAttribute(_groupStartsFrom.tabName);
                        break;
                    case GroupType.VerticalGroup:
                        propertyGroupAttribute = new VerticalGroupAttribute(_groupStartsFrom.tabName);
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
                
                attributes.Add(propertyGroupAttribute);
            }
        }
    }
}